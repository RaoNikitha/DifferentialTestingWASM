;; Create a block with an incorrect or unresolvable label index intended by design. The test expects an error in branch resolution, ensuring the implementation can correctly identify and handle branch target errors.

(assert_invalid
  (module (func $invalid-label-index
    (block (result i32) (br 1) (i32.const 0))
  ))
  "unknown label"
)