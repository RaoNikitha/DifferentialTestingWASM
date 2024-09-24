;; 8. **Test Description:** Create a `loop` followed by a `block` containing an `if` statement. Place `br` inside the `if` targeting the `block` and another `br` inside the loop targeting the `block` end. This checks CFG handling of branched exits from nested loops and conditions.

(assert_invalid
  (module
    (func $differential-br-test
      (loop
        (block
          (if (i32.const 1)
            (br 1)
          )
          (br 1)
        )
      )
    )
  )
  "invalid branch"
)