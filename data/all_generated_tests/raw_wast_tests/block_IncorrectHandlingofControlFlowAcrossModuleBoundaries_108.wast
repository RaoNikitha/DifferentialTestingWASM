;; 9. **Procedural Calls within Blocks and External Module Returns**    - Test procedural calls to varied external module functions within a block and verify that returns to the block retain stack integrity.    - Focuses on ensuring multiple procedural calls across module boundaries maintain consistent stack and label indices.

(assert_invalid
  (module
    (import "env" "externalFunc1" (func $externalFunc1 (result i32)))
    (import "env" "externalFunc2" (func $externalFunc2 (result i64)))
    (func $test
      (block (result i32)
        (call $externalFunc1)
        (call $externalFunc2)
      )
    )
  )
  "type mismatch"
)