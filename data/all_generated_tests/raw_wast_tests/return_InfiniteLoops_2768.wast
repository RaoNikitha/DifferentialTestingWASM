;; 7. Develop a function where a loop contains mutable and immutable values. Introduce a `br_if` to break on an immutable condition and a `return` to exit on a mutable condition. Check if the `return` influences the loop flow as expected when conditions are met.

(assert_invalid
  (module
    (func $test
      (local $mut_cond i32) (local $imm_cond i32) (local $x i32)
      (local.set $mut_cond (i32.const 1))
      (local.set $imm_cond (i32.const 0))
      (loop
        (br_if 0 (local.get $imm_cond))
        (local.set $x (i32.const 42))
        (return (local.get $mut_cond))
      )
    )
  )
  "type mismatch"
)