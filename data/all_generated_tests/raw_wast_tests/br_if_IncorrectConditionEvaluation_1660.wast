;; 1. Test a `br_if` instruction with a deeply nested `block` and a label index that is valid but at the boundary of depth, ensuring the condition evaluates to zero. This will check if `wizard_engine` correctly prevents out-of-bounds access.

(assert_invalid
  (module
    (func (result i32)
      (block (block (block (block (br_if 4 (i32.const 0))))
    (i32.const 1)))
  ))
  "unknown label"
)