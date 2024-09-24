;; Test 7: Incorporate `br_table` instructions where target labels and their block types involve both upward and downward stack growth. Emphasize checking stack unwinding and regrowth policies, particularly ensuring no leftovers or omissions in the stack content post every branch.

(assert_invalid
  (module (func (local i32)
    (block (result i32)
      (block (result i64)
        (i32.const 1)
        (br_table 0 1 1 (i32.const 0))
      )
      (drop)
      (i32.const 1)
    )
  ))
  "type mismatch"
)