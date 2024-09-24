;; 5. Insert `unreachable` within a `br_if`'s condition where the condition is a complex expression. Test that the presence of `unreachable` causes a trap if reached, and `br_if` correctly evaluates complex conditions before it traps.

(assert_invalid
  (module (func $br_if_complex_cond
    (block $exit
      (block
        (br_if $exit
          (i32.and 
            (i32.const 1)
            (i32.div_s (i32.const 2) (unreachable))
          )
        )
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)