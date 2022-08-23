pragma solidity 0.8.16;
contract HelloWorld{
    string message;
    
    function Hello() external returns(string memory){
        message = "Hellowordld";
        return message;
    }


}