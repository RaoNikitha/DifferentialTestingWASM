;; 1. Create a WebAssembly module that contains a function using `br_table` to branch to different blocks based on an operand. Ensure that one of the blocks calls an imported function from another module, and verify if the operand stack is correctly managed when transitioning between modules.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $test_br_table_differential (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            local.get 0
            br_table 0 1 2 (i32.const 0)
          )
          call $external_func
        )
        i32.const 1
      )
    )
  )
  "type mismatch"
)