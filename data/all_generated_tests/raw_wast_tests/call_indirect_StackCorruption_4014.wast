;; 3. Test using a `call_indirect` instruction to call a function that itself performs another `call_indirect`, deliberately setting the intermediate function to return a mismatched number of values than expected, testing for stack corruption from nested mismatches.

(assert_invalid
  (module
    (type (func))
    (type (func (result i32)))
    (table funcref (elem 0 1))
    (func $intermediate (result i32) (call_indirect (type 0) (i32.const 0)))
    (func $mismatch (call_indirect (type 1) (i32.const 1)))
  )
  "type mismatch"
)