// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";

interface KYCNFTInterface {
    function awardItem(address player, string memory tokenURI)
        external
        returns (uint256);

    function updateExpirationTime(uint256 tokenId, uint256 timestamp) external;
}

/*
n, accumulator is bigNumber，(May be out of range of uint256)，so use string as the value type
*/
contract KYCManager is Ownable {
    struct UserData {
        uint256 NFTId;
        string accumulator;
        string n;
        uint256 g;
    }

    KYCNFTInterface kycNFTContract;

    mapping(uint256 => address) private NFTIdToManager;
    mapping(address => UserData) private ManagerToUserData;
    mapping(uint256 => bool) private NFTIdToAvailable;

    //set this first!
    function setKYCNFTContractAddress(address _kycnftContractAddr)
        public
        onlyOwner
    {
        kycNFTContract = KYCNFTInterface(_kycnftContractAddr);
    }

    function createKYCNFT(
        string memory tokenUrl,
        address manager,
        uint256 expirationTime
    )   public 
        onlyOwner 
    {
        //owner of NFT is KYCManager Contract
        address kycnftmanager = (address)(this);
        uint256 NFTId = kycNFTContract.awardItem(kycnftmanager, tokenUrl);
        kycNFTContract.updateExpirationTime(NFTId, expirationTime);
        setNFTAvailableOfNFTId(NFTId, true);
        initManagerAddr(NFTId, manager);
    }

    function setNFTAvailableOfNFTId(uint256 NFTId, bool _available)
        public
        onlyOwner
    {
        NFTIdToAvailable[NFTId] = _available;
    }

    /*
    NFTIdToManager
    */
    function initManagerAddr(uint256 NFTId, address manager) 
        public 
        onlyOwner 
    {
        NFTIdToManager[NFTId] = manager;
        ManagerToUserData[manager].NFTId = NFTId;
    }

    function modifyManagerAddr(address newManager) 
        public 
    {
        UserData memory userdata = ManagerToUserData[msg.sender];
        ManagerToUserData[newManager] = userdata;
        NFTIdToManager[userdata.NFTId] = newManager;
    }

    /*
    ManagerToUserData
    The public key parameters are stored publicly in the contract, 
    and the attacker cannot forge the proof, 
    so the verifier can trust the user's proof.
    */
    function updateAccumulator(
        string memory _accumulator,
        string memory _n,
        uint256 _g
    )   public 
    {
        UserData storage userdata = ManagerToUserData[msg.sender];
        userdata.accumulator = _accumulator;
        userdata.n = _n;
        userdata.g = _g;
    }

    function updateAccumulatorPublicKey(string memory _n, uint256 _g) 
        public 
    {
        UserData storage userdata = ManagerToUserData[msg.sender];
        userdata.n = _n;
        userdata.g = _g;
    }

    function updateAccumulatorValue(string memory _accumulator) 
        public 
    {
        UserData storage userdata = ManagerToUserData[msg.sender];
        userdata.accumulator = _accumulator;
    }

    /*
    update Expiration Time For User
    */
    function updateExpirationTimeForUser(uint256 NFTId, uint256 expirationTime)
        public
        onlyOwner
    {
        kycNFTContract.updateExpirationTime(NFTId, expirationTime);
    }

    /*
    Query Data
   */

    function managerOfNFTId(uint256 NFTId) 
        public 
        view 
        returns (address) 
    {
        address addr = NFTIdToManager[NFTId];
        return addr;
    }

    function userDataOfNFTId(uint256 NFTId)
        public
        view
        returns (UserData memory)
    {
        address addr = NFTIdToManager[NFTId];
        UserData memory userdata = ManagerToUserData[addr];
        return userdata;
    }

    function userDataOfManager(address managerAddr)
        public
        view
        returns (UserData memory)
    {
        UserData memory userdata = ManagerToUserData[managerAddr];
        return userdata;
    }

    function availableOfNFTId(uint256 NFTId) 
        public 
        view 
        returns (bool) 
    {
        return NFTIdToAvailable[NFTId];
    }

    function NFTIdOfManager(address managerAddr) 
        public 
        view
        returns (uint256) 
    {
        UserData memory userdata = ManagerToUserData[managerAddr];
        return userdata.NFTId;
    }

    fallback() 
        external 
        payable 
    {
        revert();
    }

    receive() 
        external
        payable 
    {
        revert();
    }
}
