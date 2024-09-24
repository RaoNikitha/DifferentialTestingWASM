;; 7. **Empty Label Vector**    - Include a `br_table` instruction configured with an empty vector of label indices but a valid default label index. This ensures that the implementation is robust against having no target labels and defaults correctly.

(assert_invalid
  (module
    (func $empty-label-vector
      (block (br_table () 0 (i32.const 0)))
      (return)
    )
  )
  "type mismatch"
)