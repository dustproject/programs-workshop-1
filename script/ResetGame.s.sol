// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";

import { WorldResourceIdInstance } from "@latticexyz/world/src/WorldResourceId.sol";
import { console } from "forge-std/console.sol";

import { EntityId, EntityTypeLib } from "@dust/world/src/types/EntityId.sol";
import { ProgramId } from "@dust/world/src/types/ProgramId.sol";
import { Systems } from "@latticexyz/world/src/codegen/tables/Systems.sol";

import { IWorld } from "@dust/world/src/codegen/world/IWorld.sol";

import { Script } from "./Script.sol";

import { Depositors } from "../src/codegen/tables/Depositors.sol";
import { Participant, ParticipantData } from "../src/codegen/tables/Participant.sol";

contract ResetGame is Script {
  using WorldResourceIdInstance for ResourceId;

  function run() external {
    startBroadcast();

    address[] memory depositors = Depositors.get();

    for (uint256 i = 0; i < depositors.length; i++) {
      address player = depositors[i];
      Participant.deleteRecord(player);
    }

    Depositors.deleteRecord();

    vm.stopBroadcast();
  }
}
