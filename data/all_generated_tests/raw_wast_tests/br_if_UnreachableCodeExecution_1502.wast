;; - **Test 3**: Design a series of `if` statements with `br_if` targeting different depths, interleaving with `unreachable` instructions post each `br_if`. Use conditions that strategically reach specific blocks. The goal is to verify that no paths incorrectly lead to `unreachable` instructions due to erroneous branch handling.

(assert_invalid
  (module
    (func (block
            (block
              (i32.const 1)
              (br_if 1)
              (unreachable)
            )
            (br_if 0 (i32.const 0))
            (unreachable)
          )
    )
  )
  "type mismatch"
)
