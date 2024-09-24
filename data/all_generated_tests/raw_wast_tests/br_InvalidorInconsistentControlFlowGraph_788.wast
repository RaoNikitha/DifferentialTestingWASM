;; 9. **Test Description:**    - Construct a control structure where a `loop` contains a `block`, which in turn contains another `br` instruction targeting the `loop`.    - **Constraint:** Verify that the branch results in a correct backward jump to the `loop`’s start.    - **CFG Check:** Tests for CFG consistency in handling nested loops and blocks with branches targeting loops.

(assert_invalid
  (module
    (func $loop-with-block
      (loop $outer
        (block
          (br 1)
        )
      )
    )
  )
  "unknown label"
)