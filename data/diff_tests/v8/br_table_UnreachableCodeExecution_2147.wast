;; Define a `br_table` without encoding length properly for the label vector, causing it to default to a block containing an `unreachable` instruction. This test assesses the error-checking capability during the immediate parameter encoding process.

(assert_malformed
  (module (func $test-br_table-immediate-encoding (result i32)
    (block (br_table 0 1 (i32.const 2))) (i32.const 1))
  )
  "unexpected end"
)