// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract TaskContract {
  event AddTask(address recipient, uint taskId);
  event DeleteTask(bool isDeleted, uint taskId);

  struct Task{
  uint id;
  string taskText;
  bool isDeleted;
  }

  Task[] private tasks;
  mapping(uint256 => address)  taskToOwner;

  function addTask(string memory taskText, bool isDeleted)
  external {
    uint taskId = tasks.length;
    tasks.push(Task(taskId, taskText, isDeleted));
    taskToOwner[taskId] = msg.sender;
    emit AddTask(msg.sender, taskId);

  }

  function getMytasks() external view returns (Task[] memory){
    Task[] memory temporary = new Task[](tasks.length);
    uint counter = 0;

    for(uint i=0; i < tasks.length; i++){
       if(taskToOwner[i] == msg.sender && tasks[i].isDeleted == false)
       {
          temporary[counter] = tasks[i];
       }
    }
    return temporary;
  }

  function deletetask(uint taskId, bool isDeleted) external {
    if(taskToOwner[taskId] == msg.sender){
       tasks[taskId].isDeleted = isDeleted;
       emit DeleteTask(isDeleted, taskId);
    }
  }
}  
