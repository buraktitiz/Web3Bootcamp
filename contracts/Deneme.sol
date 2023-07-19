// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

/* contract Deneme{

    //Data Types 

    //int
        //uint -> 0-255;
        //uint16
        //uint32
        //... uint256;

    //string
        // "burak"[0] -> b
    //array ["b","u","r","a","k"][0] -> b
        //[12,"v",[0,"asdaasd"],true]-> X solidity'de böyle kullanamayız.
        //uint256[] - ["v"] -> X solidity'de böyle kullanamayız.

    //float* -0.78, 21.63 -> X solidity'de böyle kullanamayız.
    //bool -> true/false
    //dict -> {key: value} key'in tipi ve value'nin tipi farklı olabilir. {"burak": 33}
        //mapping(string=>uint8) 
    //date* -> X
    //char* -> X

    //address 0x...(adres)
    //bytes32 -> keccak256 hash

    string private Name; 
    uint8 private Age; 

    function setName(string memory _Name) public {
        Name = _Name;
    }

    function setAge(uint8 _Age)public {
        Age= _Age;
    }
    function getAge() public view returns(uint8) {
        return Age;
    }
    function getName() public view returns(string memory) {
        return Name;
    }
} */

/* contract PassCreator {
    function generate(uint8 _Age, uint256 _Year)private pure returns (uint256) {
        uint256 generated=(_Age + _Year)/2;
        return generated;
    }
    function createdPass(uint8 _Age, uint256 _Year, uint8 _Experience) public pure returns (uint256) {
        uint256 Pass=generate(_Age , _Year) * _Experience;

        return Pass;
    }
} */

contract OwnerContract {
    //owner var
    // const -> kontrat oluşum aşamasındayken çalışacak ilk fonksiyona ihtiyaç var.
    // getOwner

    string ContractName;
    address owner;

    constructor(string memory _ContractName){
        ContractName = _ContractName;
        owner=msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender==owner,"This is an only owner function");
        _;
    }

    function setOwner(address _owner)public payable  {
        require(msg.value>100000000000000000, "You have pay min 100000000000000000 wei");
        owner=_owner; 
    }

    function withdraw()public onlyOwner{
        //ownera transfer et
        uint256 Balance=address(this).balance;
        payable(owner).transfer(Balance);
    }

    function getOwner()public view returns (address){
        return owner;
    }

    function getContractName() public view returns (string memory){
        return ContractName;
    }
}