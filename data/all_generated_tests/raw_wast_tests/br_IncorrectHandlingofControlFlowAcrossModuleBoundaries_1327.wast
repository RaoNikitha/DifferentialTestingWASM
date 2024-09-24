;; 8. Evaluate branching within a `block` structured control targeting exported functions, ensuring the correct restoration of operands and addressing relative label indexing across module boundaries.

(assert_invalid
  (module
    (func $exported-func (export "exportedFunc") (block (br 1)))
    (func (block
      (call $exported-func)
      (block)
    ))
  )
  "unknown label"
)