//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Struct {
       // Declare a struct which groups together two data types
    struct TodoItem{
        string name;
        bool completed;
    }

       // Create an array of TodoItem structs
       TodoItem[] public todos;

      function createTodo(string memory _name) public{
       // There are multiple ways to initialize structs
       // Method 1 - Call it like a function
         todos.push(TodoItem(_name, true));
        
        // Method 2 - Explicitly set its keys
        // todos.push(TodoItem({name: _name, completed: true})); 
        
        // Method 3 - Initialize an empty struct, then set individual properties
        // TodoItem memory todo;
        // todo.name = _name;
        // todo.completed = false;
        // todos.push(todo);
      }
    
    // Update a struct value
      function updateTodo(uint _i, string memory _name) public{
          // We want to change a perticular value on a perticular index;
          todos[_i].name = _name;
      }

    // Completed Todo
      function toggleCompleted(uint _index) public {
        todos[_index].completed = !todos[_index].completed;
    }

    //Delete Todo
      function deleteTodo(uint _index) public{
          delete todos[_index];
      }
}