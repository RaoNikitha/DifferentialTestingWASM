;; Import a function from another module with no parameters and no return type `() -> ()`. Attempt to call this function indirectly with a mismatched index leading to an out-of-bounds trap. This checks the robustness of table indexing across module boundaries.

(assert_invalid
  (module
    (import "env" "my_func" (func $my_imported_func (type 0)))
    (type (func))
    (table 1 funcref)
    (func $test
      (i32.const 1)  ;; Invalid index, out of bounds
      (call_indirect (type 0))
    )
  )
  "out of bounds table access"
)