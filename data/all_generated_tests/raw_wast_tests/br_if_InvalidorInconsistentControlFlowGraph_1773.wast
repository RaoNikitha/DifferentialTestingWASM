;; 4. **Test Case 4**: Formulate a sequence of nested `block` and `loop` instructions where `br_if` targets progressively deeper nesting, ensuring correct label indexing.    - **Constraint Checked**: Proper management of LIFO label indexing.    - **CFG Relation**: Relational CFG issues if labels are misindexed, resulting in improper control flow jumps.

(assert_invalid
  (module
    (func $invalid-label-nesting
      (block
        (block
          (loop
            (br_if 2 (i32.const 1))
          )
        )
      )
    )
  )
  "label index out of range"
)