// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";

import { WorldResourceIdInstance } from "@latticexyz/world/src/WorldResourceId.sol";
import { console } from "forge-std/console.sol";

import { EntityId, EntityTypeLib } from "@dust/world/src/types/EntityId.sol";
import { Systems } from "@latticexyz/world/src/codegen/tables/Systems.sol";

import { Script } from "./Script.sol";

import { checkersGameProgram } from "../src/codegen/systems/CheckersGameProgramLib.sol";
import { checkersVaultProgram } from "../src/codegen/systems/CheckersVaultProgramLib.sol";

contract PostDeploy is Script {
  using WorldResourceIdInstance for ResourceId;

  function run(address worldAddress) external {
    StoreSwitch.setStoreAddress(worldAddress);
    address sender = startBroadcast();
    // You can do stuff here that will be executed after the deployment your programs.
    vm.stopBroadcast();
  }
}
