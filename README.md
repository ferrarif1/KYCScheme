# KYCScheme
  For the paper review of Journal: PeerJ Computer Science
 
# The code includes two parts: smart contract and RSA accumulator

 ## The smart contracts:
 [KYCNFT.sol](https://github.com/ferrarif1/KYCScheme/blob/main/KYCSchemeForAllBlockchains/contracts/KYCNFT.sol "Heading link")    
 [KYCManager.sol](https://github.com/ferrarif1/KYCScheme/blob/main/KYCSchemeForAllBlockchains/contracts/KYCManager.sol "Heading link")  
 ### Rinkeby testnet address:       
    KYCNFT：0xb81e0412554e43b47f7De63d66ED4937fC20983c  
    KYCManager：0x13eaEC178cEa0D3746A64fb800Dbf41A438d046c  
 
 ## The RSA accumulator part is here: 
 [RSA accumulator](https://github.com/ferrarif1/KYCScheme/blob/main/KYCSchemeForAllBlockchains/test/Token.js "Heading link")
 
 ## How to use?
 ###  👑 You can use KYCNFT-LocalSever(Truffle version) or KYCSchemeForAllBlockchains(Hardhat version)
 
 ### 🤖 To use KYCSchemeForAllBlockchains(Hardhat version)[ recommended ]:
 ### 1.You may have to use these commend to install hardhat:
     mkdir hardhat-tutorial 
     cd hardhat-tutorial 
     npm init --yes 
     npm install --save-dev hardhat  
     
     npx hardhat
 ### 2.Open the project in Visual Studio Code:
   The test code is in this file: ./test/Token.js
   Part of the test data is in this file directory：./test/
 ### 3.Run the following code in the console：   
     npx hardhat test
 
 ### 🤖 To use KYCNFT-LocalSever(Truffle version):
 ### 1.Start the Apache server that comes with your Mac.  
    Run Apache $ sudo apachectl start.  
    Quit Apache $ sudo apachectl stop.  
    Put the project folder in the following location /Library/WebServer/Documents.  
 ### 2.Open the browser console.  
 ### 3.To access it in your browser: type the address http://localhost/KYCScheme/blob/main/KYCNFT-LocalSever/index.html into the address bar and enter.  
  ### Example:
  <div align=center><img src="https://github.com/ferrarif1/KYCScheme/blob/main/KYCNFT-LocalSever/src/pictures/example.png" width="780px"></div>  
  
 


# The KYC contract test data is available in this directory：
[Deployment records of smart contracts](https://github.com/ferrarif1/KYCScheme/blob/main/Data/Deploy%20smart%20contract.docx "Heading link")  

The [IPFS address](https://gateway.pinata.cloud/ipfs/QmWC7L3Nb2ohLvJoUCqxFtufqAM23Bs8rEw1tRzw1WV7S6 "Heading link") of KYCNFT. 
The sample content of KYCNFT: [sample content Content](https://github.com/ferrarif1/KYCScheme/blob/main/Data/KYCNFTContent.json "Heading link")  
    
### The hash to prime and rsa accumulator test data:  
[TestData(l=x).log](https://github.com/ferrarif1/KYCScheme/tree/main/Data "Heading link")  
[hashToPrimeTestResult](https://github.com/ferrarif1/KYCScheme/blob/main/Data/hashToPrimeTestResult.txt "Heading link")    
