;; 5. **Test Description:**    - Setup a scenario where an imported function with a `br_table` branches to an exported function, which then calls back to another part of the importing module. Validate correct stack management and control flow transfer.    - **Constraint:** Verifies that crossing from imported to exported functions with intermediary control targets does not disrupt the stack.    - **Control Flow Boundary Check:** Ensures proper bookkeeping of stack changes across such multi-module interaction.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func $test
      (block
        (br_table 0 (i32.const 0))
        (call $externalFunc)
      )
    )
    (export "testFunc" (func $test))
  )
  "unknown label"
)