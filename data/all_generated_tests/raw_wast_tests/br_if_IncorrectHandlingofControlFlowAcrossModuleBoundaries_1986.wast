;; 7. **Test Description**: Craft a scenario where a module with an exported function contains several nested `block` statements. Import this function in another module which uses `br_if` to break out of several nested blocks based on the function's output.    - **Constraint Checked**: Ensures proper handling of nested blocks and stack unwinding when transitioning control flow across module boundaries using `br_if`.    - **Relation to Control Flow**: Tests that comprehensive stack unwinding and re-stacking works correctly across module calls.

(assert_invalid
  (module
    (import "env" "nested_block_func" (func $nested_block_func (result i32)))
    (func $test 
      (block 
        (block 
          (block 
            (drop (br_if 2 (call $nested_block_func)))
          )
        )
      )
    )
  )
  "type mismatch"
)