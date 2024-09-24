;; 9. Construct a `br_if` instruction nested within multiple conditional blocks. It should test within an invalid label index to ensure proper error handling and branch target resolution across multiple condition branches.

(assert_invalid
  (module (func $nested-conditional (block (block (br_if 3 (i32.const 1))))))
  "unknown label"
)