;; 3. Create a block containing a `br_table` instruction that indirectly references default case leading to an `unreachable` operation. Assess the resolution of default case properly ensuring unreachable code is avoided.

(assert_invalid
  (module (func (param i32) (result i32)
    (block (result i32) (br_table 0 1 (i32.const 1)) unreachable)
    (i32.const 0)
  ))
  "br_table default case leading to unreachable"
)