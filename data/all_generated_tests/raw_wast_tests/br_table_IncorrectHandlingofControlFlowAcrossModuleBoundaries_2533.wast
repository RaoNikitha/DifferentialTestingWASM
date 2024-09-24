;; 2. Develop a WebAssembly module with nested loops and `br_table` where one of the labels points to an imported function from a different module. Check that the correct label is targeted and the operand stack unwound properly after the `br_table` branches to the imported function.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func
      (block
        (loop
          (br_table 0 1 (i32.const 2))
        )
      )
      (call $externalFunc)
    )
  )
  "unknown label"
)