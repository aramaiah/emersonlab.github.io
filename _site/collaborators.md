# Collaborations
The Emerson Lab is a very collaborative group and has ongoing projects with many labs at UCI. Below are active collaborations we are currently pursuing on campus. Please stay tuned for external collaborations page.

* [*Drosophila* population genomics](#drosophilapopgen)
* [Genome assembly](#genomeassembly)
* [Fish physiology and genomics](#fishphysgen)
* [Experimental evolution](#experimentalevolution)

<a name = 'drosophilapopgen'></a>
## *Drosophila* population genomics

### Kevin Thornton

__We have constructed several platinum quality *Drosophila simulans* genome assemblies in order to study population variation of structural mutations and how these mutations affect gene expression.__

The [Thornton lab](http://www.molpopgen.org/) and the Emerson lab have a long standing interest in the patterns of variation associated with structural mutations, ie mutations that add, subtract, rearrange, or otherwise sculpt genome sequences. Such mutations can include tandem duplications, transposable element insertations, inversions, translocations, etc. Since we now routinely assemble platinum quality genomes from long molecule data, we can study SV in exquisite detail. [Building off of our recent work](https://academic.oup.com/nar/article/44/19/e147/2468393/Contiguous-and-accurate-de-novo-assembly-of), we have assembled four *D. simulans* genomes to a level of completeness and contiguity comparable to that exhibited by the [FlyBase reference genome](http://flybase.org/). The Thornton lab has generated expression data for these strains as well, and we are now characterizing the mutations. We have previously noted that [short read methods miss a significant proportion of structural variation](http://www.biorxiv.org/content/early/2017/03/08/114967). As a result, we are finding many mutations previously hidden from discovery. Our ultimate goal is to understand how SV segregating in natural populations affects the genome, including how it changes gene structure and transcription.

### Tony Long

__We have assembled fifteen genomes of *Drosophila melanogaster*, incuding the founders of a trait mapping panel. We are using these .__

<a name = 'genomeassembly'></a>
## Genome assembly

### Tony Long

__We have developed an experimental and computational pipeline for assembling genomes that fuses long molecule only assemblies with assemblies constructed from both short and long molecule data. This approach yields improvements in contiguity over both methods alone with minimal compromises to accuracy and completeness.__

The [Long lab](http://wfitch.bio.uci.edu/~tdlong/sandvox/) and the Emerson Lab have been avid adopters of long-molecule sequencing approaches (specifically Pacific Biosciences RS II P6/C4 chemistry) to assemble whole genomes. However, methods for assembling such data are still developing rapidly. Some approaches (like [Canu](https://github.com/marbl/canu)) employ only long molecules while others (like [DBG2OLC](https://github.com/yechengxi/DBG2OLC)) combine both long and short read data in methods know as "hybrid assembly". While for any particular data set, one method may perform better than another, they often appear to produce complementary assemblies. Mahul Chakraborty (Emerson lab) and Jim Baldwin-Brown (Long lab) have developed and evaluated a genome assembly approach called *[quickmerge](https://github.com/mahulchak/quickmerge)* for genome assembly that combines two haploid assemblies in an attempt to get the best of both worlds. In the process, we established a set of best practices for attaining accurate and contiguous metazoan assemblies, spanning DNA isolation, quality control, assembly, and polishing the assembly. Our work was published in 2016 in [*Nucleic Acids Research*](https://academic.oup.com/nar/article/44/19/e147/2468393/Contiguous-and-accurate-de-novo-assembly-of).

<a name = 'experimentalevolution'></a>
## Experimental evolution

### Brandon Gaut


