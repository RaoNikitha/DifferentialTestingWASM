;; 8. **Test 8:** Develop a function split across nested blocks, employing a `br_table` to break to an outer block that immediately issues an `unreachable`:    - **Check:** Ensure `unreachable` is managed and causes the correct trap with the `br_table`.    - **Constraint:** Correctly interprets `br_table` jumps to `unreachable` in outer blocks.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br_table 0 1 2)
            (unreachable)
          )
        )
      )
    )
  )
  "type mismatch"
)