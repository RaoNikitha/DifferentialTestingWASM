;; 5. A function with nested `br_table` instructions and strategically placed `nop` instructions to ensure the correct target of branch table jumps, confirming that the depth of nesting is accurately interpreted and not disrupted by `nop`.

(assert_invalid
  (module
    (func $test (block
      (br_table 0 (block (nop) (br_table 0)))
    ))
  )
  "type mismatch"
)