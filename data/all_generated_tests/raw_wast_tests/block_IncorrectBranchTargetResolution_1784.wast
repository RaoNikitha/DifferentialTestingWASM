;; 5. **Fall-through Branches**: Have a sequence of blocks with branches (`br`), some of which have no instructions leading to a fall-through effect. This tests if `wizard_engine` properly resolves label indices without mistakenly skipping over blocks.

(assert_invalid
  (module
    (func $fall_through_branches
      (block
        (block
          (br 1)
          (unreachable)
        )
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)