;; 3. Test Description: **Interleaved Conditionals and Loops with Multiple Exits**    - Create interleaved `if` statements and `loop` constructs with multiple conditional exits using `br`. Test if branching resumes at the correct levels of nesting depending on different conditions.    - Constraint: Checks for accurate handling of structured control instructions under interleaved conditionals and loops.

(assert_invalid
  (module
    (func $interleaved-conditionals-loops
      (block $outer
        (loop $l1
          (i32.const 1)
          (if (i32.eqz)
            (then (br $outer))
          )
          (loop $l2
            (br_if $l1 (i32.const 0))
            (if (i32.const 1)
              (then (br $l2))
              (else (br $outer))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)