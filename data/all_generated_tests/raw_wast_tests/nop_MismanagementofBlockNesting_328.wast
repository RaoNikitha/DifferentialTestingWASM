;; 9. **Test 9**: Implement deeply nested `block`, `loop`, and `if` statements with interspersed `nop` instructions. Check the behavior of `br_table` to ensure it correctly targets the desired block depending on the expression outcome, unaffected by the `nop` instructions.

(assert_invalid
  (module
    (func $test
      (block $outer
        (loop $loop
          (if (i32.const 1)
            (then
              nop
              nop
              (br_table $outer $loop $loop (i32.const 0)))))
      )
    )
  )
  "type mismatch"
)