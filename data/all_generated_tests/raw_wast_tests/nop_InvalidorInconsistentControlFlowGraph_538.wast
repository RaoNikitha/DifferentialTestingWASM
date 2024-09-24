;; 9. Incorporate `nop` at the start and end of a multi-branched `select` instruction to validate the correct path is selected and no branches are erroneously disregarded due to incorrect CFG setup.

(assert_malformed
  (module (func (param i32) (param i32) (param i32)
    (select (nop) (param.get 1) (param.get 2) (param.get 0)) (nop)))
  "malformed select instruction"
)