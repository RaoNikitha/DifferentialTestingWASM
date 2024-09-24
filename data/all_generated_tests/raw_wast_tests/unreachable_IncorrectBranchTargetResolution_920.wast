;; 1. **Test Description:** Utilize `unreachable` within a `br` instruction targeting a block nested inside another block, checking incorrect branch target resolution due to position tracking differences.    *Constraint Checked:* Ensuring correct label management when `br` resolves nested block labels improperly.    *Relation to Incorrect Branch Target Resolution:* Probes if the `br` targets the innermost block correctly, which can be misinterpreted with faulty position tracking.

(assert_invalid
  (module (func $incorrect-branch-target-resolution
    (block (result i32)
      (block (result i64)
        (unreachable) (br 2)
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)