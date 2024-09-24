;; 8. **Test Description:** Set up a block containing multiple sequences of `br` instructions with varying target depths. Place `unreachable` instructions in invalid positions to detect erroneous jumps.     - **Constraint Checked:** Compliance with structured control flow preventing jumps to invalid positions.     - **Relation to Unreachable Code Execution:** Ensures the structured control flow is respected, avoiding unintended execution of `unreachable`.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br 3)
          )
          unreachable
        )
      )
    )
  )
  "unknown label"
)