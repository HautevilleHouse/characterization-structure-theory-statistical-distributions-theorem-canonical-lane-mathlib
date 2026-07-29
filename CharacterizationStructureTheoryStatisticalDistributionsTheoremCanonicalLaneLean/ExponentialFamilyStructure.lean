import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure ExponentialFamilyStructure where
  sampleSpace : Type u
  sigmaAlgebra : Set (Set sampleSpace)
  dominatingMeasure : sampleSpace → ℝ
  sufficientStatistic : sampleSpace → ℝⁿ
  naturalParameter : ℝⁿ → ℝ
  logPartitionFunction : ℝⁿ → ℝ
  carrierDensity : ℝⁿ → sampleSpace → ℝ
  exponentialForm : Prop
  regularOpenSet : Prop
  minimalRepresentation : Prop
  exponentialFormTerm : exponentialForm
  regularOpenSetTerm : regularOpenSet
  minimalRepresentationTerm : minimalRepresentation

structure ExponentialFamilyEvidence (E : ExponentialFamilyStructure) where
  exponentialFormClosed : E.exponentialForm
  regularOpenSetClosed : E.regularOpenSet
  minimalRepresentationClosed : E.minimalRepresentation

def ExponentialFamilyClosed (E : ExponentialFamilyStructure) : Prop :=
  E.exponentialForm ∧ E.regularOpenSet ∧ E.minimalRepresentation

theorem exponential_family_closed_from_evidence (E : ExponentialFamilyStructure) (Ev : ExponentialFamilyEvidence E) : ExponentialFamilyClosed E := by
  exact And.intro Ev.exponentialFormClosed (And.intro Ev.regularOpenSetClosed Ev.minimalRepresentationClosed)

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse