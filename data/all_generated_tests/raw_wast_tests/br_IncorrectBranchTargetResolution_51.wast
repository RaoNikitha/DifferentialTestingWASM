;; 2. **Test Description: Multiple Sibling Labels**    - Create multiple sibling `block` instructions at the same nesting level and use a `br` instruction to jump to one of them.

(assert_invalid
 (module
  (func $multiple_sibling_labels
   (block (br 1))
   (block (result i32) (i32.const 0) (drop))
  )
 )
 "invalid label"
)