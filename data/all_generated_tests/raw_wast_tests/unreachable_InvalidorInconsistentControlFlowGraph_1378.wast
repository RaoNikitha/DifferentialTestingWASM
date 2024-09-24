;; 9. **Test Unreachable Within Loop-final Block:**    - Insert an `unreachable` in a block that is the final segment of a loop cycle. Ensure it traps correctly without affecting the loop's ability to iterate.    - **Constraint Checked:** Verifying correct loop continuation despite `unreachable` at loop exit block.    - **CFG Relation:** Poor CFG might misinterpret the trapping as loop-breaking, affecting subsequent loop cycles.

(assert_invalid
  (module
    (func $test_loop_unreachable
      (loop $L
        (block
          (br 1)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)