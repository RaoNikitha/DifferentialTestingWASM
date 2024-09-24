;; 4. **Test Description**: Create a scenario where module A calls a function in module B that contains nested `nop` instructions within loops or conditional statements. Verify that the presence of multiple `nop` instructions does not distort the control flow and nested structure.

 ;; (module
  (import "B" "funcB" (func $importedFunc))
  (func $A
    (block
      (loop
        (if (i32.const 1) (then (nop)))
        (call $importedFunc)
        (br 1)
      )
    )
  )
)
(register "A")
(module $B
  (func $B
    (block
      (loop
        (if (i32.const 1) (then (nop)))
        (return)
      )
    )
  )
  (export "funcB" (func $B))
)
(assert_invalid
  (invoke "A" "funcB")
  "invalid instruction sequence"
)