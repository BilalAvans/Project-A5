<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use AppBundle\Entity\OntvangenGoederen;
use AppBundle\Form\Type\OntvangenGoederenType;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.root_dir').'/..').DIRECTORY_SEPARATOR,
        ]);
    }

/**
* @Route("/ontvangengoederen/nieuw", name="ontvangengoederennieuw")
*/
public function nieuweOntvangenGoederen(Request $request) {
    $nieuweOntvangenGoederen = new OntvangenGoederen();
    $form = $this->createForm(OntvangenGoederenType::class, $nieuweOntvangenGoederen);

    $form->handleRequest($request);
    if ($form->isSubmitted() && $form->isValid()) {
        $em = $this->getDoctrine()->getManager();
        $em->persist($nieuweOntvangenGoederen);
        $em->flush();
        return $this->redirect($this->generateurl("ontvangengoederennieuw"));
    }
    return new Response($this->render('form.html.twig', array ('form' => $form->createView())));
}


}
