;; 2. Define a `loop` inside a `block` and use `br` to target the `loop`. The test examines if the instruction correctly identifies the loop position for a backward jump, ensuring the execution resumes at the loop's entry, testing proper **loop target resolution**.

(assert_invalid
  (module
    (func $test-loop-target-resolution
      (block
        (loop (br 1))
      )
    )
  )
  "type mismatch"
)