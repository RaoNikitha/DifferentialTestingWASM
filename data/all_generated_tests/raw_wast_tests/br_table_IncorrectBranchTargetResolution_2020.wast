;; 1. Create a test with a single `br_table` instruction which lists several labels and includes a default label. Ensure the operand provided is out of the label index range, forcing a branch to the default label. This test will check if the implementation correctly resolves the default branch target when the operand index is out of bounds.

(assert_invalid
 (module
  (func (block $default
   (block $label1
    (br_table $label1 $default (i32.const 2)) (unreachable))
   (unreachable)) 
  )
 )
 "type mismatch"
)