pragma solidity ^0.8.0;
import "TransparentUpgradeableProxy.sol";
import "ERC20.sol";
contract ProxyDeployment {
    address proxy;
    ERC20 erc20;
    constructor (string memory name_, string memory symbol_, uint256 totalSupply_, address issuer_, address logic_) {
        bytes memory _data = abi.encodeWithSignature("initialize(string,string,uint256,address)", name_, symbol_, totalSupply_, issuer_);
        TransparentUpgradeableProxy _proxy = new TransparentUpgradeableProxy(logic_, issuer_, _data);
        proxy = address(_proxy);
    }
    function getProxyAddress() public view returns(address){
        return proxy;
    }
}
