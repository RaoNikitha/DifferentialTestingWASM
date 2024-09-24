;; 4. **Mixed Control Instruction Branching:**    - Test a combination of `block`, `if`, and `loop` with `br` instructions targeting different constructs.    - Focuses on checking if the CFG correctly interprets mixed control flow instructions and if branches maintain structured control.

(assert_invalid
  (module
    (func $mixed-control-branching
      (block
        (loop
          (if
            (i32.const 1)
            (then (br 2))
            (else (br 1))
          )
          (br 0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)