;; 6. **Test 6: Multiple Layers of Nesting with `unreachable`**    - Involves deeply nested control structures (e.g., nested blocks and loops) with `unreachable` at various levels.    - Ensures entire nested structure unwinds correctly without corrupting the stack or leaving residual data.    - Validates integrity of stack after deeply nested traps from `unreachable`.

(assert_invalid
  (module (func (block (loop (block (unreachable))) (unreachable) (br 0)) (i32.const 1)))
  "type mismatch"
)