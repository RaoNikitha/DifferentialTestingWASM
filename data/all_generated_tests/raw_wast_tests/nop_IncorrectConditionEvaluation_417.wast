;; 8. Introduce a `nop` before a `br_if` checking a dynamic variable. Ensure the branch correlates with the variable's value and is not erroneously influenced by the presence of `nop`.

(assert_invalid
  (module (func (param i32) (local.get 0) (nop) (br_if 0 (local.get 0))))
  "type mismatch"
)