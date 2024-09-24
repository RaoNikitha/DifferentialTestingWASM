;; **Test 9**: Create a WASM module with a `call_indirect` instruction inside a loop where the loop index is manipulated to deliberately cause an invalid table index. Check if the loop's CFG is correctly formed, observing how the implementations handle invalid iterations and potential infinite loops or unreachable loop exits.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $invalid-table-index-in-loop
      (loop
        (call_indirect (type $sig) (local.get 0))
        (local.set 0 (i32.add (local.get 0) (i32.const -1)))
      )
    )
  )
  "out of bounds table index"
)