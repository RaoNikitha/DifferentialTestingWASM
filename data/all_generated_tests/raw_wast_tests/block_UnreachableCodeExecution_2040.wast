;; 1. Create a block that includes an inner block with invalid label indexing using `br` to an index larger than the nested context allows. Ensure the unreachable instruction follows the misreferenced branch to test if control flow erroneously reaches the unreachable instruction.

(assert_invalid
  (module (func $invalid-label-indexing
    (block (block (br 2) (unreachable)))
  ))
  "unknown label"
)