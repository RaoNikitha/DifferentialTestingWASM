;; 3. A test containing an `if` statement that has a `nop` in the then and else branches but requires operand stack manipulation within those branches.

(assert_invalid
  (module
    (func $test
      (if (i32.const 1)
        (then
          (nop)
          (i32.add (i32.const 1) (i32.const 1))
        )
        (else
          (nop)
          (i32.sub (i32.const 1) (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)