;; 4. Introduce an `if` block within a `loop` where the `else` portion incorrectly resumes a control flow branching outside the well-nested structure, causing invalid CFG paths.

(assert_invalid
  (module
    (func $invalid-loop-if-else
      (block
        (loop
          (br_if 0 (i32.const 1))
          (if (i32.const 0) (then (br 1)) (else (br 2)))
        )
      )
    )
  )
  "invalid basic control flow"
)