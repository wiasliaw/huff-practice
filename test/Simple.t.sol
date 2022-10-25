// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "openzeppelin-contracts/contracts/utils/Create2.sol";

interface IHuffSimple {
    function set(uint256) external;
    function get() external returns (uint256);
}

contract TestSimple is Test {
    IHuffSimple private _simple;

    function testSimple() external {
        string memory wrapper_code = vm.readFile("test/mock/SimpleNoConstructor.mock.huff");
        HuffConfig config = HuffDeployer
            .config()
            .with_code(wrapper_code);
        _simple = IHuffSimple(config.deploy("Simple"));

        _simple.set(33);
        console.log(_simple.get());
    }
}

