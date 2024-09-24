;; 1. **Test 1**: Create a deeply nested block and then insert a `br` instruction targeting a label index greater than the number of enclosing blocks. This tests the Wizard Engine’s ability to correctly identify that the target label is not valid due to mismanagement of label indexing and nesting control.

(assert_invalid
  (module (func $deep-nested-label 
    (block (block (block (block (block (br 6)))))))
  )
  "unknown label"
)