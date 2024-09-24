;; 9. Test a loop containing instructions to manipulate memory and table elements followed by `br` and `br_if` branches. Ensure that changes to the memory and table do not introduce inconsistencies or corrupt the operand stack when iterating through the loop.

(assert_invalid
(module
  (memory 1)
  (table 1 funcref)
  (func $test
    (i32.const 0) (i32.const 1) (i32.store)
    (i32.const 0) (table.set 0)
    (loop (result i32)
      (i32.const 0) (i32.load) (i32.const 1) (i32.add)
      (i32.eqz) (br_if 0)
      (br 1)
    )
  )
)
"type mismatch"
)